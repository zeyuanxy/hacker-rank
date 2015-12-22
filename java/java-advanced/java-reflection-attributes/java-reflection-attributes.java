/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-22 17:26:20
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-22 17:26:27
*/

public class Solution {

        public static void main(String[] args){
            Class student = Student.class;
            Method[] methods = student.getDeclaredMethods();

            ArrayList<String> methodList = new ArrayList<>();
            for(Method method: methods){
                methodList.add(method.getName());
            }
            Collections.sort(methodList);
            for(String name: methodList){
                System.out.println(name);
            }
        }

    }
