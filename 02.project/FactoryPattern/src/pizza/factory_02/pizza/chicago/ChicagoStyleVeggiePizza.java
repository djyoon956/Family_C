package pizza.factory_02.pizza.chicago;

import pizza.factory_02.pizza.Pizza;

public class ChicagoStyleVeggiePizza extends Pizza {
	public ChicagoStyleVeggiePizza() {
		this.name = "시카고 Veggie 피자";
		this.dough = "씬";
		this.sauce = "시카고 산 토마토 소스";
		this.toppings.add("시카고 산 Pepperoni");
	}
}
