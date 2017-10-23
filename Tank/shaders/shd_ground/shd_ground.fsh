//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 finder = vec4(1.0, 1.0, 1.0, 1.0);
    float cnt = 0.0;
    while (finder.a == 1.0)
    {
        finder = v_vColour * texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - cnt));
        cnt += 0.03;
        if (cnt >= 1.0)
        {
            break;
        }
    }
    gl_FragColor.r = 0.463;
    gl_FragColor.g = 0.365;
    gl_FragColor.b = 0.259;
    gl_FragColor.rgb *= vec3(1.0 - v_vTexcoord.y);
}

