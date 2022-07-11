#ifndef PERLINNOISE3D_INCLUDED
#define PERLINNOISE3D_INCLUDED

#include "PerlinNoise3D.cginc"

void PerlinNoise3D_float(in float3 p, out float value)
{
	float frequency = 2.0;

	value = Perlin3D(p * frequency);
}

void PerlinNoise3D_float(in float3 p, in int octaves, in float frequency, in float amplitude, in float lacunarity, in float persistence, out float value)
{
	/*int octaves = 1;
	float frequency = 2.0;
	float amplitude = 1.0;
	float lacunarity = 1;
	float persistence = 0.8;*/

	value = 0;
	for (int i = 0; i < octaves; i++)
	{
		float h = 0;
		h = Perlin3D(p * frequency);
		value += h * amplitude;
		frequency *= lacunarity;
		amplitude *= persistence;
	}
}

#endif //PERLINNOISE3D_INCLUDED