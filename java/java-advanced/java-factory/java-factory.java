/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-23 21:02:10
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-23 21:02:30
*/

try {
    return (Food)Class.forName(order.substring(0, 1).toUpperCase() + order.substring(1)).newInstance();   
} catch (Exception e) {
    System.out.println(e);
    return null;
}