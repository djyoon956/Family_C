package abstract_sample;

public class Cat extends Animal {
	public Cat() {
		name = "고양이";
	}

	@Override
	void speak() {
		System.out.println("야옹 야옹");
	}
}
