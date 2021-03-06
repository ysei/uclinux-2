/********************************************************************
 *                                                                  *
 * THIS FILE IS PART OF THE OggVorbis 'TREMOR' CODEC SOURCE CODE.   *
 *                                                                  *
 * USE, DISTRIBUTION AND REPRODUCTION OF THIS LIBRARY SOURCE IS     *
 * GOVERNED BY A BSD-STYLE SOURCE LICENSE INCLUDED WITH THIS SOURCE *
 * IN 'COPYING'. PLEASE READ THESE TERMS BEFORE DISTRIBUTING.       *
 *                                                                  *
 * THE OggVorbis 'TREMOR' SOURCE CODE IS (C) COPYRIGHT 1994-2002    *
 * BY THE Xiph.Org FOUNDATION http://www.xiph.org/                  *
 *                                                                  *
 ********************************************************************

 function: simple example decoder using vorbisidec

 ********************************************************************/

/* Takes a vorbis bitstream from stdin and writes raw stereo PCM to
   stdout using vorbisfile. Using vorbisfile is much simpler than
   dealing with libvorbis. */

#include <stdio.h>
#include <stdlib.h>
#include <ivorbiscodec.h>
#include <ivorbisfile.h>
#include <linux/soundcard.h>

#include <fcntl.h>
#ifdef _WIN32 /* We need the following two to set stdin/stdout to binary */
#include <io.h>
#include <fcntl.h>
#endif
#define DEV "/dev/dsp"
//char pcmout[4096]; /* take 4k out of the data segment, not the stack */
char pcmout[65536]; /* take 4k out of the data segment, not the stack */

int main(int argc, char *argv[]){
  OggVorbis_File vf;
  int eof=0;
  int current_section;
  FILE *fp;
int dev=0;		
    
char **ptr;
vorbis_info *vi;
#ifdef _WIN32 /* We need to set stdin/stdout to binary mode. Damn windows. */
  /* Beware the evil ifdef. We avoid these where we can, but this one we 
     cannot. Don't add any more, you'll probably go to hell if you do. */
  _setmode( _fileno( stdin ), _O_BINARY );
  _setmode( _fileno( stdout ), _O_BINARY );
#endif
if(argc < 2)
{
	printf("Usage : ivorbisfile_example <ogg filename>\n");
	exit(0);
}
fp = fopen(argv[1],"rb");
if(fp == NULL)
	printf("File open error\n");		
  //if(ov_open(stdin, &vf, NULL, 0) < 0) {
  if(ov_open(fp, &vf, NULL, 0) < 0) {
      fprintf(stderr,"Input does not appear to be an Ogg bitstream.\n");
      exit(1);
  }
  /* Throw the comments plus a few lines about the bitstream we're
     decoding */
 // {
    ptr=ov_comment(&vf,-1)->user_comments;
    vi=ov_info(&vf,-1);
    while(*ptr){
      fprintf(stderr,"%s\n",*ptr);
      ++ptr;
	//printf(". \n");		
    }
    fprintf(stderr,"\nBitstream is %d channel, %ldHz\n",vi->channels,vi->rate);
    fprintf(stderr,"\nDecoded length: %ld samples\n",
	    (long)ov_pcm_total(&vf,-1));
    fprintf(stderr,"Encoded by: %s\n\n",ov_comment(&vf,-1)->vendor);
 // }

if ((dev = open(DEV, O_RDWR)) < 1) {
	printf("Device open failed");
}
 #if 1
{
  int i, v;
  v = vi->rate/2;//22050;
  i = ioctl(dev, SNDCTL_DSP_SPEED, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_SPEED)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
  v = 1;
  i = ioctl(dev, SNDCTL_DSP_STEREO, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_STEREO)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
  v = AFMT_S16_BE;
  i = ioctl(dev, SNDCTL_DSP_SAMPLESIZE, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_SAMPLESIZE)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
}
#endif
 
#if 0
{
  int i, v;
  v = 44100;
  i = ioctl(fileno(stdout), SNDCTL_DSP_SPEED, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_SPEED)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
  v = 1;
  i = ioctl(fileno(stdout), SNDCTL_DSP_STEREO, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_STEREO)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
  v = AFMT_S16_BE;
  i = ioctl(fileno(stdout), SNDCTL_DSP_SAMPLESIZE, &v);
  fprintf(stderr, "%s(%d): ioctl(SNDCTL_DSP_SAMPLESIZE)=%d, set=%d\n",
	__FILE__, __LINE__, i, v);
}
#endif

  while(!eof){
    long ret=ov_read(&vf,pcmout,sizeof(pcmout),&current_section);
//	printf("\nRet = %d\n",ret);	
    if (ret == 0) {
      /* EOF */
      eof=1;
    } else if (ret < 0) {
      /* error in the stream.  Not a problem, just reporting it in
	 case we (the app) cares.  In this case, we don't. */
    } else {
      /* we don't bother dealing with sample rate changes, etc, but
	 you'll have to*/
      //fwrite(pcmout,1,ret,stdout);
      write(dev,pcmout,ret);
    }
  }

  /* cleanup */
  ov_clear(&vf);
    
  fprintf(stderr,"Done.\n");
  return(0);
}
