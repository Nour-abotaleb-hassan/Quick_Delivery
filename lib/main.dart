import 'package:flutter/material.dart';

const coral = Color(0xFFFF6266);
const coralLight = Color(0xFFFF8587);
const ink = Color(0xFF303033);
const muted = Color(0xFF929297);
const pageBg = Color(0xFFF8F8F8);

void main() => runApp(const DoorstepApp());

class DoorstepApp extends StatelessWidget {
  const DoorstepApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Doorstep',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: pageBg,
      colorScheme: ColorScheme.fromSeed(seedColor: coral, primary: coral),
      fontFamily: 'Roboto',
    ),
    home: const GettingStartedPage(),
  );
}

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: coral,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          children: [
            const Positioned(top: 32, left: 22, child: _Bubble(size: 22)),
            const Positioned(top: 120, right: 24, child: _Bubble(size: 40)),
            const Positioned(top: 225, left: 28, child: _Bubble(size: 18)),
            const Positioned(top: 195, right: -6, child: _Bubble(size: 30)),
            Positioned.fill(
              top: 28,
              bottom: 190,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/courier.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                    const ColoredBox(color: Color(0x22FF6266)),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 19,
                          height: 1.15,
                          fontWeight: FontWeight.w700,
                          color: ink,
                        ),
                        children: [
                          TextSpan(text: 'Quick Delivery at\nyour '),
                          TextSpan(
                            text: 'Doorstep',
                            style: TextStyle(color: coral),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Hot and delicious food delivered right to your door.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: muted, fontSize: 10, height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    _GradientButton(
                      label: 'Get Started',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size});
  final double size;
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      color: Color(0x22FFFFFF),
      shape: BoxShape.circle,
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: pageBg,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    const Text('🍕', style: TextStyle(fontSize: 58)),
                    const SizedBox(height: 15),
                    Text.rich(
                      const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ink,
                        ),
                        children: [
                          TextSpan(text: 'Quick Delivery at\nyour '),
                          TextSpan(
                            text: 'Doorstep',
                            style: TextStyle(color: coral),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                'Email',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 9),
              _InputField(
                controller: email,
                hint: 'Type your e-mail',
                icon: Icons.mail_outline,
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 9),
              TextField(
                controller: password,
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: 'Type your password',
                  filled: true,
                  fillColor: const Color(0xFFEDF3F4),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => obscure = !obscure),
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: coral,
                      size: 19,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 56),
              _GradientButton(
                label: 'Login',
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ),
  );
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
  });
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFFADB9BC), fontSize: 12),
      filled: true,
      fillColor: const Color(0xFFEDF3F4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 47,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [coralLight, coral]),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x339B3539),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

class Meal {
  const Meal({
    required this.name,
    required this.price,
    required this.emoji,
    required this.rating,
    required this.description,
  });
  final String name;
  final String price;
  final String emoji;
  final String rating;
  final String description;
}

const meals = [
  Meal(
    name: 'Melting Cheese',
    price: '\$9.47',
    emoji: '🍕',
    rating: '4.9',
    description: 'A golden crispy crust topped with rich tomato sauce, bubbling mozzarella, fresh basil and our chef’s special seasoning.',
  ),
  Meal(
    name: 'Pizza Capricciosa',
    price: '\$12.55',
    emoji: '🍕',
    rating: '4.8',
    description: 'A classic favorite with mushrooms, olives, tender cheese and a fresh, savory tomato base.',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu, size: 21),
                ),
                const Spacer(),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: coral,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            const Text('Hi Alex', style: TextStyle(color: coral, fontSize: 12)),
            const SizedBox(height: 5),
            const Text(
              'Find your Delicious Food',
              style: TextStyle(
                color: ink,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 60,
              child: Row(
                children: const [
                  _Category(icon: '🍕', label: 'Italian', selected: true),
                  SizedBox(width: 13),
                  _Category(icon: '🍱', label: 'Japanese', selected: false),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Popular',
              style: TextStyle(
                color: ink,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                itemCount: meals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 13,
                  childAspectRatio: .73,
                ),
                itemBuilder: (context, i) => _MealCard(meal: meals[i]),
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: coral,
      unselectedItemColor: muted,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    ),
  );
}

class _Category extends StatelessWidget {
  const _Category({
    required this.icon,
    required this.label,
    required this.selected,
  });
  final String icon, label;
  final bool selected;
  @override
  Widget build(BuildContext context) => Container(
    width: 55,
    padding: const EdgeInsets.symmetric(vertical: 7),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x10000000),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        Text(
          label,
          style: TextStyle(fontSize: 7, color: selected ? coral : ink),
        ),
      ],
    ),
  );
}

class _MealCard extends StatelessWidget {
  const _MealCard({required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ItemPage(meal: meal)),
      ),
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 11, 10, 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal.name,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF1E8),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/pizza.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFB833), size: 13),
                const SizedBox(width: 3),
                Text(meal.rating, style: const TextStyle(fontSize: 10)),
                const Spacer(),
                Text(
                  meal.price,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.meal});
  final Meal meal;
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 18, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            widget.meal.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Color(0xFFFFB833), size: 14),
              const SizedBox(width: 3),
              Text(widget.meal.rating, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Container(
                width: 270,
                height: 270,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF4EA),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/pizza.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    setState(() => quantity = quantity > 1 ? quantity - 1 : 1),
                icon: const Icon(Icons.remove_circle, color: coral),
              ),
              Text('$quantity', style: const TextStyle(fontSize: 15)),
              IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add_circle, color: coral),
              ),
            ],
          ),
          Text(
            '\$${(double.parse(widget.meal.price.substring(1)) * quantity).toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 12, color: muted),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _Info(icon: Icons.star, color: Color(0xFFFFB833), text: '4.9'),
                _Info(
                  icon: Icons.local_fire_department,
                  color: Color(0xFFFF8738),
                  text: '440 Calories',
                ),
                _Info(
                  icon: Icons.access_time,
                  color: Color(0xFF64A7F5),
                  text: '20 - 30 min',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 25, 24, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.meal.description,
                style: const TextStyle(color: muted, height: 1.5, fontSize: 13),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 7, 22, 24),
            child: _GradientButton(
              label: 'ADD TO CART',
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$quantity ${widget.meal.name} added to cart'),
                  backgroundColor: coral,
                  behavior: SnackBarBehavior.floating,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _Info extends StatelessWidget {
  const _Info({required this.icon, required this.color, required this.text});
  final IconData icon;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 13, color: color),
      const SizedBox(width: 3),
      Text(text, style: const TextStyle(fontSize: 10, color: ink)),
    ],
  );
}
