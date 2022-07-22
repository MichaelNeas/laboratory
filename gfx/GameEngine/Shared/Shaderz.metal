#include <metal_stdlib>
using namespace metal;

#include "definitions.h"

struct Fragment {
    float4 position [[position]];
    float4 color;
};

vertex Fragment vertexShader(const device Vertex *vertexArray [[buffer(0)]], unsigned int vid [[vertex_id]]) {
    Vertex input = vertexArray[vid];
    
    Fragment output;
    output.position = float4(input.position.x, input.position.y, 0, 1);
    output.color = input.color;
    
    return output;
}

fragment float4 fragmentShader(Fragment input [[stage_in]]) {
    return input.color;
}

//// Attribute tags are confuse
//vertex float4 basic_vertex_shader(const device float3 *vertices [[ buffer(0) ]],
//                                  uint vertexID [[ vertex_id ]]) {
//    return float4(vertices[vertexID], 1);
//}
//
//fragment half4 basic_fragment_shader() {
//    return half4(1);
//}
