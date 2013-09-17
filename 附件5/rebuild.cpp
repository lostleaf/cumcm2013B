#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
#define maxn 440
using namespace std;
const int n = 418;
double g[maxn][maxn];
int match[maxn],m,bd[maxn][maxn];
bool ur[maxn];
struct A
{
    double v;
    int x,y;
};
A arr[maxn*maxn];
int cmp(const A &x, const A &y)
{
    return x.v>y.v;
}

void adjust()
{
    g[72][320] = 1.1;
    g[248][220] =1.1;
    g[188][265] =1.1;
    g[397][363] = 1.1;
    g[319][71] = 1.1;
    g[222][349] = 1.1;
}

int main()
{
    freopen("LR.txt", "r", stdin);
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
            scanf("%lf", g[i]+j);
    adjust();
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++){
            //scanf("%lf", g[i]+j);
            arr[m].v = g[i][j];
            arr[m].x = i;
            arr[m++].y = j;
        }
    sort(arr, arr+m, cmp);
    
  
    freopen("DF.txt", "r", stdin);
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
            scanf("%d", bd[i]+j);    

    for(int i=0;i<m;i++)
        if(!match[arr[i].x] && !ur[arr[i].y] && (bd[arr[i].x][arr[i].y]<7||arr[i].v>=0.95))
        {
            match[arr[i].x] = arr[i].y;
            ur[arr[i].y] = 1;    
        }
    
    freopen("match.txt", "w", stdout);
    for(int i=1;i<=n;i++)
        printf("%d%c", g[i][match[i]]==0?0:match[i], i < n ? ',' : ' ');
    return 0;
}
