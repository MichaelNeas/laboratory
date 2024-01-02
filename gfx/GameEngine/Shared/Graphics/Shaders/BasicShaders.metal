
#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

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
fragment half4 basicFragmentShader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]]){
//    float4 color = material.useMaterialColor ? material.color : rd.color;
    float2 texCoord = rd.textureCoordinate;
    float gameTime = rd.totalGameTime;
    
    float x = sin((texCoord.x + gameTime)*20.0);
    float y = sin((texCoord.y - gameTime)*20.0);
    float z = tan((texCoord.x + gameTime)*20.0);
    float4 color = float4(x,y,z,1);
                                                        
    return half4(color.r, color.g, color.b, color.a);
}
