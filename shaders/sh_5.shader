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
// perlin noise test
// by @yunta_robo


#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;


float cosine_interpolate(float _y1, float _y2, float _r)
{
	float r2;
	r2 = (1.0 - cos(_r * 3.1415926)) / 2.0;
	return (_y1 * (1.0 - r2) + _y2 * r2);
}

float rand(vec2 _v, float _seed)
{
	// 0.0 .. 1.0
	return fract(sin(dot(_v, vec2(12.9898, 78.233))) * (43758.5453 + _seed));
}

float noise(vec2 _v, float _seed, vec2 _freq)
{
	float fl1 = rand(floor(_v * _freq), _seed);
	float fl2 = rand(floor(_v * _freq) + vec2(1.0, 0.0), _seed);
	float fl3 = rand(floor(_v * _freq) + vec2(0.0, 1.0), _seed);
	float fl4 = rand(floor(_v * _freq) + vec2(1.0, 1.0), _seed);
	vec2 fr = fract(_v * _freq);

#if 0
	// linear interpolate
	float r1 = mix(fl1, fl2, fr.x);
	float r2 = mix(fl3, fl4, fr.x);
	return mix(r1, r2, fr.y);
#else
	// cosine interpolate
	float r1 = cosine_interpolate(fl1, fl2, fr.x);
	float r2 = cosine_interpolate(fl3, fl4, fr.x);
	return cosine_interpolate(r1, r2, fr.y);
#endif
}

float perlin_noise(vec2 _pos, float _seed, float _freq_start, float _amp_start, float _amp_ratio)
{
	float freq = _freq_start;
	float amp = _amp_start;
	float pn = noise(_pos, _seed, vec2(freq, freq)) * amp;
	for(int i=0; i<4; i++)
	{
		freq *= 2.0;
		amp *= _amp_ratio;
		pn += (noise(_pos, _seed, vec2(freq, freq)) * 2.0 - 1.0) * amp;
	}
	return pn;
}

void main( void )
{
	// position
	vec2 pos = ( v_vTexcoord.xy / resolution - 0.5) * 2.0;
	float a = resolution.x / resolution.y;
	pos.x *= a;

	// perlin_noise
	vec2 pos_ = pos + time * 0.1;
	float seed = 0.0;
	float freq_start = 1.5;
	float amp_start = 1.0;
	float amp_ratio = 0.35;
	float pn = perlin_noise(pos_, seed, freq_start, amp_start, amp_ratio);

#if 1
	// smoke
	gl_FragColor = vec4(pn * 0.8, pn * 1.0, pn * 1.5, 1.0);
#else
	// dizzy!!!
	pn = fract(pn * 20.0 + sin(time));
	gl_FragColor = vec4(pn * 3.0, pn * 1.0, pn * 0.2, 1.0);
#endif
}


