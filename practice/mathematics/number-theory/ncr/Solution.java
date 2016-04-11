// Reference from Hatena

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.math.BigInteger;

public class Solution {
    static Reader input = new BufferedReader(new InputStreamReader(System.in));
    static final int MOD = 142857;
    static final int[] ps = new int[] { 3, 11, 13, 37 };
	static final int[] bases = new int[] { 27, 11, 13, 37 };
	static int[][] factTables = new int[ps.length][];
    
    public static void main(String[] args) throws Exception {
        initFactTables();
        StringBuilder sb = new StringBuilder();
        int T = nextInt();
        for (int i = 0; i < T; ++i) {
            int N = nextInt();
            int R = nextInt();
            if (R > N / 2) {
                R = N - R;
            }
            sb.append(solve(N, R) + "\n");
        }
        System.out.print(sb);
    }
    
    static void initFactTables() {
        for (int i = 0; i < bases.length; ++i) {
            factTables[i] = new int[bases[i]];
            int f = 1;
            for (int j = 0; j < bases[i]; ++j) {
                factTables[i][j] = f;
                if ((j + 1) % ps[i] != 0) {
                    f *= j + 1;
                }
                f %= bases[i];
            }
        }
    }
    
    static int solve(int n, int r) {
        int[][] res = new int[4][];
        int[] rem = new int[4];
        for (int i = 0; i < 4; ++i) {
            rem[i] = modComb(n, r, bases[i], ps[i], factTables[i]);
        }
        return chineseRemainder(bases, rem);
    }
    
    static int[] modFact(int n, int p, int base, int[] factTable) {
		if (n == 0) return new int[] { 1, 0 };
		int[] ret = modFact(n / base, p, base, factTable);
		ret[1] += n / base;
		if (n / p % 2 == 0) {
			ret[0] = ret[0] * factTable[n % p] % p;
		} else {
			ret[0] = ret[0] * (p - factTable[n % p]) % p;
		}
		return ret;
	}

	static int modComb(int n, int r, int p, int base, int[] factTable) {
		int[] a1 = modFact(n, p, base, factTable);
		int[] a2 = modFact(r, p, base, factTable);
		int[] a3 = modFact(n - r, p, base, factTable);
		int pow = a1[1] - a2[1] - a3[1];
		int rem;
		if (base == 3) {
			if (pow >= 3) {
				rem = 0;
			} else {
				rem = a1[0] * inv(a2[0] * a3[0] % p, p) % p;
				for (int i = 0; i < pow; ++i) {
					rem *= base;
				}
				rem %= p;
			}
		} else {
			if (pow > 0) {
				rem = 0;
			} else {
				rem = a1[0] * inv(a2[0] * a3[0] % p, p) % p;
			}
		}
		return rem;
	}
    
    static int chineseRemainder(int[] mod, int[] rem) {
        int m1 = mod[0];
        int r1 = rem[0];
		for (int i = 1; i < mod.length; ++i) {
			int m2 = mod[i];
			int r2 = rem[i];
			r1 = chineseRemainder(m1, r1, m2, r2);
			m1 *= m2;
		}
		return r1;
	}
    
    static int chineseRemainder(int m1, int r1, int m2, int r2) {
        int A = ((r2 - r1) % m2 + m2) * inv(m1, m2) % m2;
		return (A * m1 + r1) % (m1 * m2);
    }
    
    static int inv(int v, int mod) {
		return pow(v, totient(mod) - 1, mod);
	}

	static int totient(int v) {
		int ret = v;
		for (int i = 0; i < ps.length && v > 1; ++i) {
			if (v % ps[i] == 0) {
				v /= ps[i];
				while (v % ps[i] == 0) {
					v /= ps[i];
				}
				ret /= ps[i];
				ret *= (ps[i] - 1);
			}
		}
		return ret;
	}

	static int pow(int v, int p, int mod) {
		if (p == 0) return 1;
		int ret = pow(v, p / 2, mod);
		ret *= ret;
		ret %= mod;
		if (p % 2 == 1) {
			ret *= v;
			ret %= mod;
		}
		return ret;
	}
    
    static int nextInt() throws Exception {
		int sign = 1;
		int b = input.read();
		while ((b < '0' || '9' < b) && b != '-' && b != '+') {
			b = input.read();
		}
		if (b == '-') {
			sign = -1;
			b = input.read();
		} else if (b == '+') {
			b = input.read();
		}
		int ret = b - '0';
		while (true) {
			b = input.read();
			if (b < '0' || '9' < b) return ret * sign;
			ret *= 10;
			ret += b - '0';
		}
	}

}