@RestResource (urlmapping='/restservice')
global with sharing class Restdemo {

 @HttpGet
  global static string displayMsg(){
  	
  	return  'hello from rest service';
  }
}