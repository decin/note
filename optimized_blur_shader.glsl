static char* OPTIMIZED_BLUR_SCENE_HORIZONTAL_VERTEX_SHADER =
		"attribute vec4 position;    			   												\n"
		"attribute vec2 texcoord;   	   															\n"
		"uniform float texelWidthOffset;	   														\n"
		"uniform float texelHeightOffset;	   													\n"
		"const int GAUSSIAN_SAMPLES = 9;	   														\n"
		"varying vec2 textureCoordinate;															\n"
		"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];											\n"
		"																						\n"
		"void main(void)               															\n"
		"{                            															\n"
		"   gl_Position = position;  															\n"
		"   textureCoordinate = texcoord.xy;														\n"
		"   							  															\n"
		"   // Calculate the positions for the blur												\n"
		"   int multiplier = 0;																	\n"
		"   vec2 blurStep;																		\n"
		"   vec2 singleStepOffset = vec2(texelWidthOffset, 3.5 * texelHeightOffset);				\n"
		"   for (int i = 0; i < GAUSSIAN_SAMPLES; i++)											\n"
		"   {																					\n"
		"   		multiplier = (i - ((GAUSSIAN_SAMPLES - 1) / 2));									\n"
		"   		blurStep = float(multiplier) * singleStepOffset;									\n"
		"   		blurCoordinates[i] = texcoord.xy + blurStep;										\n"
		"   }																					\n"
		"}                            															\n";

//Shader.frag文件内容
static char* OPTIMIZED_BLUR_SCENE_HORIZONTAL_FRAG_SHADER =
	"precision lowp float;																		\n"
	"uniform sampler2D yuvTexSampler;															\n"
	"const lowp int GAUSSIAN_SAMPLES = 9;														\n"
	"varying vec2 textureCoordinate;																\n"
	"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];												\n"
	"																							\n"
	"void main()																					\n"
	"{																							\n"
    "	lowp vec3 sum = vec3(0.0);																\n"
    "   lowp vec4 fragColor=texture2D(yuvTexSampler,textureCoordinate);							\n"
    "																							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[0]).rgb * 0.05;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[1]).rgb * 0.09;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[2]).rgb * 0.12;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[3]).rgb * 0.15;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[4]).rgb * 0.18;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[5]).rgb * 0.15;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[6]).rgb * 0.12;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[7]).rgb * 0.09;							\n"
    "    sum += texture2D(yuvTexSampler, blurCoordinates[8]).rgb * 0.05;							\n"
    "																							\n"
    "	gl_FragColor = vec4(sum,fragColor.a);													\n"
	"}																							\n";


static char* OPTIMIZED_BLUR_SCENE_VERTICAL_VERTEX_SHADER =
		"attribute vec4 position;    			   												\n"
		"attribute vec2 texcoord;   	   															\n"
		"uniform float texelWidthOffset;	   														\n"
		"uniform float texelHeightOffset;	   													\n"
		"const int GAUSSIAN_SAMPLES = 9;	   														\n"
		"varying vec2 textureCoordinate;															\n"
		"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];											\n"
		"																						\n"
		"void main(void)               															\n"
		"{                            															\n"
		"   gl_Position = position;  															\n"
		"   textureCoordinate = texcoord.xy;														\n"
		"   							  															\n"
		"   // Calculate the positions for the blur												\n"
		"   int multiplier = 0;																	\n"
		"   vec2 blurStep;																		\n"
		"   vec2 singleStepOffset = vec2(3.5 * texelWidthOffset, texelHeightOffset);				\n"
		"   for (int i = 0; i < GAUSSIAN_SAMPLES; i++)											\n"
		"   {																					\n"
		"   		multiplier = (i - ((GAUSSIAN_SAMPLES - 1) / 2));									\n"
		"   		blurStep = float(multiplier) * singleStepOffset;									\n"
		"   		blurCoordinates[i] = texcoord.xy + blurStep;										\n"
		"   }																					\n"
		"}                            															\n";


static char* OPTIMIZED_BLUR_SCENE_VERTICAL_FRAG_SHADER =
		"precision lowp float;																	\n"
		"uniform sampler2D yuvTexSampler;														\n"
		"const lowp int GAUSSIAN_SAMPLES = 9;													\n"
		"varying vec2 textureCoordinate;															\n"
		"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];											\n"
		"																						\n"
		"void main()																				\n"
		"{																						\n"
		"	lowp vec3 sum = vec3(0.0);															\n"
		"   lowp vec4 fragColor=texture2D(yuvTexSampler,textureCoordinate);						\n"
		"																						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[0]).rgb * 0.05;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[1]).rgb * 0.09;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[2]).rgb * 0.12;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[3]).rgb * 0.15;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[4]).rgb * 0.18;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[5]).rgb * 0.15;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[6]).rgb * 0.12;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[7]).rgb * 0.09;						\n"
		"    sum += texture2D(yuvTexSampler, blurCoordinates[8]).rgb * 0.05;						\n"
		"																						\n"
		"	gl_FragColor = vec4(sum,fragColor.a);												\n"
		"}																						\n";