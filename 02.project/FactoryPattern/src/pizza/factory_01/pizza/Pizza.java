package pizza.factory_01.pizza;

import java.util.ArrayList;

public class Pizza {

	String name;
	String dough;
	String sauce;
	ArrayList<String> toppings = new ArrayList<>();

	public void prepare() {
		System.out.println("Preparing : " + name);
		System.out.println("Tossing dough...");
		System.out.println("Adding source");
		System.out.println("Adding toppings");
		for (String topping : toppings) {
			System.out.println("\ttopping : " + topping);
		}
	}

	public void bake() {
		System.out.println("Bake for 25 minutes at 350");
	}

	public void cut() {
		System.out.println("Cutting the pizza into diagonal slices");
	}

	public void box() {
		System.out.println("Place pizza in official PizzaStore box");
	}

	public String getname() {
		return this.name;
	}
}
