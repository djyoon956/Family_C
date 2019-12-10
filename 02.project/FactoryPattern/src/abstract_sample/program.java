package abstract_sample;

public class program {
	public static void main(String[] args) {
		/*
		 * Animal dog = new Dog(); System.out.println("내 이름은 : " + dog.name); dog.eat();
		 * dog.howl();
		 * 
		 * Animal cat = new Cat(); System.out.println("내 이름은 : " + cat.name); cat.eat();
		 * cat.howl();
		 */

		String name = "dog";
		Animal animal = null;
		if (name.equals("dog")) {
			animal = new Dog();
		} else if (name.equals("cat")) {
			animal = new Cat();
		}
		
		System.out.println("내 이름은 : " + animal.name);
		animal.eat();
		animal.speak();
	}
}
