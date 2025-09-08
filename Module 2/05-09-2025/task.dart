class Emp
{
  var name;
  var salary;

  Emp(var n, var s)
  {
    print("the name is : $n");
    print("salary is : $s");

}
}

class Manager  extends Emp
{
 Manager(super.n , super.s);

}

void main ()

{
  Manager m1 = Manager("jiya", "12345");
  Manager m2 = Manager("jiya", "888888");

}