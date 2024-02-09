const int N = 2;
const int M = 3;
int a[N][M] = {342, 654, 263, 463, 975, 378};
int rows_sum[N];

void compute_row_sum(int a[N][M], int rows_sum[N]){
	for (int i=0; i < N; i++) {
		rows_sum[i]=0;
		for (int j=0; j < M; j++) {
			rows_sum[i] += a[i][j];
		}
	}
}

int main(){
	compute_row_sum(a, rows_sum);
}
