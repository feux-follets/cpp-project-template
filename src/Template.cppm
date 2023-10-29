export module Template;

import std.compat;

export template <typename T>
class stack {
  public:
	void push(const T& t);
	const T& top() const;
	bool empty() const;
	T pop();

  private:
	std::vector<T> mData;
};

template <typename T>
void stack<T>::push(const T& t) {
	mData.push_back(t);
}

template <typename T>
const T& stack<T>::top() const {
	assert(!empty());
	return mData.back();
}

template <typename T>
T stack<T>::pop() {
	assert(!empty());
	T elem = mData.back();
	mData.pop_back();
	return elem;
}
