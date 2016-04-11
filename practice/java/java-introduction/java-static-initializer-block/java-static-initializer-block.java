/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-20 00:05:45
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-20 00:06:04
*/

static int B;
static int H;
static boolean flag=true;
static BufferedReader br;

static {
    try {
        br = new BufferedReader(new InputStreamReader(System.in));
        B=Integer.parseInt(br.readLine());
        H=Integer.parseInt(br.readLine());
        if(B < -100 || B > 100 || H < -100 || H > 100)
            throw new Exception("Out of range");
        if(B <= 0 || H <= 0)
            throw new Exception("Breadth and height must be positive");
    } catch (Exception e) {
        System.out.print(e);
        flag=false;;
    }
}
