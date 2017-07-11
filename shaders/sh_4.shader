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
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y , in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec2 v_vTexcoord;
#ifdef GL_ES
precision highp float;
#endif

uniform vec2 resolution;
uniform float time;

vec3 heart( float x, float y )
{
    float s = mod( time, 1.0 ) / 8.0;
    s = 0.9 + 0.1*(1.0-exp(-5.0*s)*sin(50.0*s));
    x *= s;
    y *= s;
    float a = atan(x,y)/3.14159265359;
    float r = sqrt(x*x*1.5+y*y);

    float h = abs(a);
    float d = (13.0*h - 22.0*h*h + 10.1*h*h*h)/(6.0-5.0*h);
    float g = pow(1.0-clamp(r/d,0.0,1.0),0.25);

    return vec3(0.5+0.5*g,0.2,0.4);
}

void main(void)
{
    vec2 p = (-1.0+2.0*v_vTexcoord.xy/resolution.xy);
    vec3 col = heart(p.x, p.y-0.35 );
    gl_FragColor = vec4(col,1.0);

}
