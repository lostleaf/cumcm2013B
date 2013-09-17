#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
#define maxn 215
using namespace std;
const int n = 209;
double g[maxn][maxn];
int match[maxn],m,bd[maxn][maxn];
bool ur[maxn];
struct A
{
    double v;
    int x,y;
};
A arr[n*n];
int cmp(const A &x, const A &y)
{
    return x.v>y.v;
}

void adjust()
{
    g[142][89]=1;
    g[106][156]=1;
    g[197][199]=1;
    g[107][5]=1.1;
    g[21][42]=1.1;
    g[180][144]=1.1;
    g[1][103]=1.1;
    g[126][141]=1.1;
    g[87][52]=1.1;
    g[6][60]=1.1;
    g[99][25]=1.1;
    g[93][31]=1.1;
    g[64][139]=1.1;
    g[154][54]=1.1;
    g[86][51]=1.1;
    g[193][134]=1.1;
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
        if(!match[arr[i].x] && !ur[arr[i].y] && (bd[arr[i].x][arr[i].y]<5||arr[i].v>=0.95))
        {
            match[arr[i].x] = arr[i].y;
            ur[arr[i].y] = 1;    
        }
    
    freopen("match.txt", "w", stdout);
    for(int i=1;i<=n;i++)
        printf("%d%c", g[i][match[i]]==0?0:match[i], i < n ? ',' : ' ');
    return 0;
}
