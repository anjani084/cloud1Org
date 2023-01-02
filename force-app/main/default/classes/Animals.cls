public virtual with sharing class Animals {
    String Name{get; private set;}
    integer weight{get; private set;}
    integer age{get; private set;}

    public Animals(String Name, Integer weight, Integer age) {
        this.Name=Name;
        this.weight=weight;
        this.age=age;
    }
    
    public void makeSound(){
        system.debug(this.Name + ' make a sound ');
    }

    public virtual void eat(){
        system.debug('The animal is eating ');
    }

    public virtual void mov(){
        system.debug(' The animal is moving');
    }
}