#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData {
    // x, y, z, w (homogeneus component)
    float4 position [[position]];
    float4 color;
};

struct ModelConstants {
    float4x4 modelMatrix;
};

struct SceneConstants {
    float4x4 viewMatrix;
    float4x4 projectionMatrix;
};

struct Material {
    float4 color;
    bool useMaterialColor;
};

// vertex shader main task is to process incoming vertex data and map to screen space
// vertex shader passes all the data into the rasterizer
// position should come out the way it went in, color will get interpolated
vertex RasterizerData vertexShader(const VertexIn vIn [[stage_in]],
                                   constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                   constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    
    RasterizerData output;
    // model space, model coordinates, mvp
    output.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    output.color = vIn.color;
    
    return output;
}

// gets used after the rasterizer
// each fragment will get the interpolated color and spits out a pixel
// [[stage_in]] is an attribute qualifier, marking per fragment
fragment float4 fragmentShader(RasterizerData input [[stage_in]],
                               constant Material &material [[ buffer(1) ]]) {
    return material.useMaterialColor ? material.color : input.color;
}

//// [[ Attribute tags ]]
//vertex float4 basic_vertex_shader(const device float3 *vertices [[ buffer(0) ]],
//                                  uint vertexID [[ vertex_id ]]) {
//    return float4(vertices[vertexID], 1);
//}
//
//fragment half4 basic_fragment_shader() {
//    return half4(1);
//}
