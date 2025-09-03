getdetails(var name, var surname,{var email, var city})

{
 if ( name!= null)
   {
     print("$name");
   }
 if ( surname!= null)
 {
   print("$surname");
 }
 if ( city!= null)
 {
   print("$city");
 }
 if ( email!= null)
 {
   print("$email");
 }
}
void main()
{
  getdetails("jiya", "hargun",city: "jetpur", email: "j@gmail.com");
  getdetails("abc", "efgj");
  
}
