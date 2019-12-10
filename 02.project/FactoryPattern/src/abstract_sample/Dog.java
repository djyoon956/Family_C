package abstract_sample;

public class Dog extends Animal {

	public Dog() {
		name = "강아지";
	}

	@Override
	public void speak() {
		System.out.println("멍멍");
	}
}
