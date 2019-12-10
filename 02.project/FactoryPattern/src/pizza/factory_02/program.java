package pizza.factory_02;

import pizza.factory_02.pizza.Pizza;
import pizza.factory_02.store.*;

public class program {
	public static void main(String[] args) {
		PizzaStore store = new NYPizzaStore();
		Pizza pizza = store.orderPizza("pepper");
		System.out.println("주문 하신 피자 정보");
		System.out.println(pizza.toString());
	}
}
