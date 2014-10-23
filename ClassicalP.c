/* This is a simple program that calculates the <p^2> of classical kicked rotor*/
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define N 100000 /* N is the total evolution steps for each point in phase space*/
#define	r 1.0  /* r is */
#define s 3.0
#define v (2*M_PI*r/s)
#define q 3.0  /* q is the kicking frequency, which can be resonant or non-resonant*/
#define K 0.8  /* K is the kicking strength*/
#define M 0.0  /* M is the mass*/
#define Pi 1.0  /* [-Pi, Pi] is the range of initial momentum p */
#define Thi (2.0*M_PI/q)  /* [0, Thi] is the range of initial theta */
#define N2 100 /* N2 is the total number of initial grid in p */
#define N3 100 /* N3 is the total number of initial grid in theta */
#define NN (N2*N3)
#define control 1 /*This is to determine which initial space to use: delta function or Gaussian packet. 1 for Gaussian and 0 for delta-function*/




int main()
{
	int j, k, len, index=0;
	double delta_p, delta_th, p_start=-Pi, th_start=0.0, sum;
	double *P, *Th, *P_mini, *Th_mini; /* They record the data points in the space */
	FILE *fp,*fth;
	char name[10],name2[10];

	delta_p=2.0*Pi/(double)N2;
	delta_th=Thi/(double)N3;

	P=(double*) malloc(sizeof(double)*NN);
	Th=(double*) malloc(sizeof(double)*NN);

	P_mini=(double*) malloc(sizeof(double)*N2);
	Th_mini=(double*) malloc(sizeof(double)*N3);
 
	for(j=0;j<N2;++j){
		P_mini[j]=p_start;
		p_start=p_start+delta_p;
	}
	for(k=0;k<N3;++k){
		Th_mini[k]=th_start;
		th_start=th_start+delta_th;
	}
	for(k=0;k<N3;++k){
		for(j=0;j<N2;++j){
			P[index]=P_mini[j];
			Th[index]=Th_mini[k];
			index=index+1;
		}
	}

	fp=fopen("PXP.txt","w");
	for(len=0;len<N;++len) {
		sum=0.0;
		for(j=0;j<NN;++j) {
			sum=sum+P[j]*P[j];
			Th[j]=v*v*abs(P[j])/sqrt(v*v*P[j]*P[j]+M*M) + Th[j];
			P[j]=q*K*sin(q*Th[j]) + P[j];			
		}
		fprintf(fp,"%lf\n",sum/NN);
	}

	fclose(fp);
 
	return 0;
}
