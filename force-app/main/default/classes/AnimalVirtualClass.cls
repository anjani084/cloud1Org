public virtual with sharing class AnimalVirtualClass {
    String name {get; private set;}
    Integer weight {get; private set;}
    Integer age {get; private set;}
    
    public AnimalVirtualClass(string name, Integer weight, Integer age){
        this.name=name;
        this.weight=weight;
        this.age=age;
    }
    public void makeSound(){
        system.debug(this.name + 'makes a sound');
    }
    public virtual void move(){
        system.debug('The animal is moving');
    }
    public virtual void eat(){
        system.debug('the animal is eating');
    }
}