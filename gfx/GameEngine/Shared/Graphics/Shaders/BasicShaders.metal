
#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

// gpu side
// vertex shader main task is to process incoming vertex data and map to screen space
// vertex shader passes all the data into the rasterizer
// position should come out the way it went in, color will get interpolated
vertex RasterizerData basicVertexShader(const VertexIn vIn [[ stage_in ]],
                                        constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                        constant ModelConstants &modelConstants [[ buffer(2) ]]){
    RasterizerData rd;
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    rd.textureCoordinate = vIn.textureCoordinate;
    rd.totalGameTime = sceneConstants.totalGameTime;
    
    return rd;
}

// gets used after the rasterizer
// each fragment will get the interpolated color and spits out a pixel
// [[stage_in]] is an attribute qualifier, marking per fragment
// mtl textures are sent through to the GPU
fragment half4 basicFragmentShader(RasterizerData rd [[ stage_in ]],
                                   constant Material &material [[ buffer(1) ]],
                                   constant int &lightCount [[ buffer(2)]],
                                   constant LightData *lightData [[ buffer(3)]],
                                   sampler sampler2d [[sampler(0)]],
                                   texture2d<float> texture [[texture(0)]]){
    float2 texCoord = rd.textureCoordinate;
    float4 color;
    
    if (material.useTexture) {
        color = texture.sample(sampler2d, texCoord);
    } else if (material.useMaterialColor) {
        color = material.color;
    } else {
        color = rd.color;
    }
    
    if (material.isLit) {
        // sum of all the ambients combined
        float3 totalAmbient = float3(0,0,0);
        for(int i = 0; i < lightCount; i++) {
            LightData someLightData = lightData[i]; // m light
            
            // ambient lighting
            float3 ambient = material.ambient * someLightData.ambientIntensity;
            float3 ambientColor = ambient * someLightData.color;
            totalAmbient += ambientColor;
        }
        float3 phongIntensity = totalAmbient; // + totalDiffuse + totalSpecular
        color *= float4(phongIntensity, 1.0); // gives us a color with a reduced ambient value
    }

    return half4(color.r, color.g, color.b, color.a);
}
