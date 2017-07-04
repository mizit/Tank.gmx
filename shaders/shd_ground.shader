//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
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

