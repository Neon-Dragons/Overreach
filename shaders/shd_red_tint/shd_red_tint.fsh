varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_flashAmount;

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 baseColor = texColor * v_vColour;

    vec3 flashColor = vec3(1.0, 0.0, 0.0);
    vec3 resultRGB = mix(baseColor.rgb, flashColor, u_flashAmount);
    gl_FragColor = vec4(resultRGB, baseColor.a);
}
