package shoes.factory_03;

import shoes.factory_03.shoes.Shoes;
import shoes.factory_03.store.ShoesStore;
import shoes.factory_03.store.NewyorkShoesStore;

public class program {
	public static void main(String[] args) {
		ShoesStore store = new NewyorkShoesStore();
		Shoes shoes = store.orderShoes("brownShoes");

		System.out.println("주문 구두 정보");
		System.out.println(shoes.toString());
	}
}
