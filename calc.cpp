#include<iostream.h>

void clear(double[], int);
double facto(int);
double sqrot(double);
double cbrt(double);
double calc_w_ave(double[1000][2]);
bool primetest(int, int[]);
void primewriter(int []);
int gcf(int, int, int[]);
void prime_factorazation(int, int[], int[]);

int main(void)
{
double a;                                               //a
double ans=1;                                           //ans  
double arrat[1000][2];                                  //arrat
double array[10000];                                    //array
double ave[100];                                        //ave
double aver[20];                                        //aver
int b;                                                  //b
double c;                                               //c 
int d;                                                  //d 
double dif=array[0];                                    //dif
int f=0;                                                //f 
int g=1;                                                //g
int h=0;                                                //h  
int i;                                                  //i 
int j;                                                  //j 
int jh=0;                                               //jh
int k;                                                  //k
int l;                                                  //l
int m;                                                  //m 
int n;                                                  //n
int o;                                                  //o  
int primes[500]={2};                                    //primes
double prod=1;                                          //prod
double quo=array[0];                                    //quo
double sum=0;                                           //sum
double summ=0;                                          //summ
int u=0;                                                //u
int w;                                                  //w
int x;                                                  //x
char xx;                                                //xx
double y;                                               //y 
int z;                                                  //z
char zz;                                                //zz
while(true)
    {
	zz='\0';
    cout<<"\nPlease input the type of operation you would like to use.\n";
    cout<<"\nA-Add\n\n";
    cout<<"S-Subtract\n\n";
    cout<<"M-Multiply\n\n";
    cout<<"D-Divide\n\n";
    cout<<"O-Other\n\n";
    cout<<"When you are finished type Ctrl C! \n";
    cin>>xx;
    if(xx!='A' && xx!='a' && xx!='S' && xx!='s' && xx!='M' && xx!='m' && xx!='D' &&
    xx!='d'&& xx!='O' && xx!='o')
        {
        cout<<"Your input isn't valid\n";
        return 0;
        }
    i=0;
    if(xx=='O' || xx=='o')
        {
        cout<<"\nR-Divide (Remainder)\n\n";
        cout<<"F-Factorial\n\n";
        cout<<"E-Exponents\n\n";
        cout<<"Q-Quadrant Determination\n\n";
        cout<<"S-Square Root\n\n";
        cout<<"C-Cube Root\n\n";
        cout<<"A-Average\n\n";
        cout<<"W-Weighted Average\n\n";
        cout<<"P-Prime Factorization\n\n";
        cout<<"G-Greatest Commom Factor\n\n";
		cout<<"L-Least Common Multiple\n\n"; 
        cout<<"B-Back\n\n";
        cout<<"When you are finished type Ctrl C! \n";
        cin>>zz;
        if(zz!='R' && zz!='r' && zz!='F' && zz!='f' && zz!='E' && zz!='e' && zz!='Q'
        && zz!='q' && zz!='S' && zz!='s' && zz!='C' && zz!='c' && zz!='B' && zz!='b'
        && zz!='A' && zz!='a' && zz!='W' && zz!='w' && zz!='P' && zz!='p' && zz!='G'
		&& zz!='g' && zz!='L' && zz!='l')
                {
                cout<<"Your input isn't valid\n";
                return 0;
                }
        }
	if(zz=='L' || zz=='l')
		{
		cout<<"Please input the first number\n";
		cin>>x;
		cout<<"Please input the second number\n";
		cin>>z;
		cout<<"\n"<<x*z/gcf(x, z, primes)<<"\n\n";
		}	
    if(zz=='G' || zz=='g')
		{
		cout<<"Please input the first number\n";
		cin>>l;
		cout<<"Please input the second number\n";
		cin>>w;
		cout<<"\n"<<gcf(l, w, primes)<<"\n";  
		}
    if(zz=='P' || zz=='p')
        {
        cout<<"Input the number you would like to find the prime factorization of\n";
        primewriter(primes);
        cin>>k;
        bool flag=false;
        cout<<"\n";
        cout<<k<<" = ";
        while(h<500)
            {
            while(k%primes[h]==0)
                {
                k=k/primes[h];
                if(flag==true)
                    {
                    cout<<" x ";
                    }
                cout<<primes[h];
                flag=true; 
                }
            h++;
            }
        cout<<"\n\n";
        }    
    if(zz=='S' || zz=='s')
        {
        cout<<"Please input the number you wish to seek the square root of \n";
        cin>>a;
        cout<<"\n"<<char(251)<<a<<" = "<<sqrot (a)<<"\n\n";
        }
    if(zz=='C' || zz=='c')
        {
        cout<<"Please input the number you wish to find the cube root of \n";
        cin>>y;     
        cout<<"\n"<<cbrt (y)<<"\n\n";                                
        }
    if(zz=='A' || zz=='a')
        {
        cout<<"Input the numbers you would like to be averaged\n";
        cout<<"Input 101 or greater to calcuale\n20 max inputs\n";
        while(true)
            {
            cin>>aver[i];
            if(aver[i]>100)
                {
                break;
				}
            }
        while(jh<=i-1)
            {
            summ=summ+aver[jh];
            jh++;
            }
        cout<<"\n"<<summ/double(i)<<"\n\n";
        }
    if(zz=='W' || zz=='w')
        {
        arrat[0][0]=1;
        arrat[0][1]=1;
        while(u==0 || arrat[u-1][0]>0)
            {
			cout<<"When you are finished, input less than 0 for the wieght";
            cout<<"\nInput weight\n";
            cin>>arrat[u][1];
			if(arrat[u][1]<=0)
				{
				break;
				}	
            cout<<"Input number for that weight\n";
            cin>>arrat[u][0];
            u++;
            }
        cout<<"\n"<<calc_w_ave(arrat)<<"\n\n";
        }
    if(zz=='F' || zz=='f')
        {
        cout<<"Please input the number that you would like to be factorealized! \n";
        cout<<"Don't input any number higher than 1000!\n";
        cin>>b;
        if (b<=0 || b>1000 )
            {
            cout<<"Input (" << b << ") out of range. ( YOU DEUTSCH FOOL )!"<<"\n";
            }
        else
            {
            cout<<"\n"<<b<<"! is "<<facto(b)<<"\n\n";
            }
        }
    if(zz=='Q' || zz=='q')
       {
       cout<<"Please input the angle that you want to be determined! \n";
       cin>>m;
       if (m%360==0)
            {
            cout<<"\n"<<"Positive X"<<"\n\n";
            }                
        else if (m%360==90 || m%360==-270)
            {
            cout<<"\n"<<"Positive Y"<<"\n\n";
            }                
        else if (m%360==180 || m%360==-180)
            {
            cout<<"\n"<<"Negative X"<<"\n\n";
            }                
        else if (m%360==270 || m%360==-90)
            {
            cout<<"\n"<<"Negative Y"<<"\n\n";
            }                
        else if ((m%360<90 && m%360>0) || (m%360<-270 && m%360>-360))
            {
            cout<<"\n"<<"I"<<"\n\n";
            }                
        else if ((m%360<180 && m%360>90) || (m%360<-180 && m%360>-270))
            {
            cout<<"\n"<<"II"<<"\n\n";
            }                
        else if ((m%360<270 && m%360>180) || (m%360<-90 && h%360>-180))
            {
            cout<<"\n"<<"III"<<"\n\n";
            }                
        else if ((m%360<360 && m%360>270) || (m%360<0 && m%360>-90))
            {
            cout<<"\n"<<"IV"<<"\n\n";
            }
        else
            {
            cout<<" YOU DEUTSCH FOOL "<<"\n";
            }
        }
    if(zz=='E' || zz=='e')
        {
        cout<<"Please input the base. \n";
        cin>>c;                                              
        cout<<"Please input exponent. \n";                                             
        cin>>d;
        while (f<d)
            {                                        
            ans=ans*c;
            f++;
            }
        cout<<"\n"<<ans<<"\n\n";
        }     
    if(zz=='R' || zz=='r')
        {
        cout<<"Please input the WHOLE numbers that you would like to be divided. \n";
        cin>>n;
        cin>>o;
        cout<<"\n"<<int (n/o)<<" R."<<n%o<<"\n\n";
        }
    if(zz=='B' || zz=='b')
        {
        cout<<"\nPlease input the type of operation you would like to use.\n";
        cout<<"\nA-Add\n\n";
        cout<<"S-Subtract\n\n";
        cout<<"M-Multiply\n\n";
        cout<<"D-Divide\n\n";
        cout<<"When you are finished type Ctrl C! \n";
        cin>>xx;
        if(xx!='A' && xx!='a' && xx!='S' && xx!='s' && xx!='M' && xx!='m' && xx!='D' &&
        xx!='d')
            {
            cout<<"Your input isn't valid \n";
            return 0;
            }
        }
    if(xx=='A' || xx=='a')
        {
        cout<<"Please input the numbers you would like to be added.\n";
        cout<<"When you are finished, input 0!\n";
        clear(array, 0);
        cin>>array[0]; 
        while(array[g-1] !=0)
            {
            cin>>array[g];
            g++;
            }
        while(i<10000)
            {   
            sum=sum+array[i];
            i++;
            }
        cout<<"\n"<<sum;
        cout<<"\n\n";
        }         
    if(xx=='S' || xx=='s')
        {
        cout<<"Please input the numbers you would like to subtract.\n";
        cout<<"When you are finished, input 0!\n";
        clear(array, 0);
        cin>>array[0]; 
        while(array[g-1] !=0)
            {
            cin>>array[g];
            g++;
            }
        while(i<99)
            {
            dif=dif-array[i+1];
            i++;        
            }
        cout<<"\n"<<dif;
        cout<<"\n\n";
        }
    if(xx=='M' || xx=='m')
        {
        cout<<"Please input the numbers that you would like to be multiplyed.\n";
        cout<<"when you are finished, input 1!\n";
        clear(array, 1);
        cin>>array[0];
        while(array[g-1] !=1)
            {
            cin>>array[g];
            g++;
            }
        while(i<100)
            {
            prod=prod*array[i];
            i++;
            }
        cout<<"\n"<<prod;
        cout<<"\n\n";
        }
    if(xx=='D' || xx=='d')
        {
        cout<<"Please input the numbers that you would like to be divided.\n";
        cout<<"when you are finished, input 1!\n";       
        clear(array, 1);
        cin>>array[0];
        while(array[g-1] !=1)
            {
            cin>>array[g];
            if(array[g]==0)
                {
                cout<<char(236)<<"!!";
                }
            if(array[0]==0)
                {
                cout<<char(236)<<"!!";
                }
            g++;
            }
        while(i<99)
            {
            quo=quo/array[i+1];
            i++;
            }
        cout<<"\n"<<quo;
        cout<<"\n\n";           
        }
    }
}

double sqrot (double w)
{
double prev=0;
double ans=1;
while(ans!=prev)
    {
    prev=ans;
    ans=(w-ans*ans)/(2*ans)+ans;
    }
return ans;
}

double cbrt(double w)
{
double prev=0;
double ans=1;
while(ans!=prev)
    {
    prev=ans;
    ans=(w-ans*ans*ans)/(3*ans*ans)+ans;
    }
return ans;
}

void clear(double t[], int e)
{
int i=0;
while(i<100)
    {
    t[i]=e;
    i++;
    }
}

double facto(int x)
{
double ans=1;
while(x>0)
    {
    ans=ans*x;
    x--;
    }
return ans;
}

double calc_w_ave(double array[1000][2])
{
int i=0;
double sum=0;
double sum2=0;
while(array[i][0]>=0)
    {
    sum2+=array[i][0]*array[i][1];
    sum+=array[i][1];
    i++;
    }
return sum2/sum;
}

void primewriter(int array[])
{
int i=0;
for(int can=3; i<500; can++)
    {
    if(primetest(can, array))
        {
        i++;
        array[i]=can;
        }
    }
}

bool primetest(int x, int array[])
{
for(int i=0; array[i]*array[i]<=x; i++)
    {
    if(x%array[i]==0)
        {
        return false;
        }
    }
return true;
}

int gcf(int x, int y, int primes[])
{
primewriter(primes);
int prmx[500];
int prmy[500];
for(int k=0; k<500; k++)
	{
	prmx[k]=prmy[k]=0;
	}
int gcf=1;
int i, j;
prime_factorazation(x, prmx, primes);
prime_factorazation(y, prmy, primes);
int numx=0;
int numy=0;
bool x_gt_y=false;
for(i=0; prmx[i]!=0; i++)
	{
	numx++;
	}
for(i=0; prmy[i]!=0; i++)
	{
	numy++;
	}
if(numx>numy)
	{
    x_gt_y=true;
	}
i=j=0;
while(prmy[j]!=0)
	{
	if(prmx[i]==0 || prmy[j]==0)
		{
		break;
		}
	if(prmx[i]==prmy[j])
		{
		gcf*=prmx[i];
		i++;
		j++;
		}
	else
		{
		if(x_gt_y==true)
			{
			i++;
			}
		else
			{
			j++;
			}
		}
	}
return gcf;
}

void prime_factorazation(int a, int prma[], int primes[])
{
int j=0;
for(int i=0; a>1; i++)
	{
	while(a%primes[i]==0)
		{
		a/=primes[i];
		prma[j]=primes[i];
		j++;
		}
	}
} 
