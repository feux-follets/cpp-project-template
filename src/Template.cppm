export module Template;

import std.compat;

export template <typename T, typename Container = std::vector<T>>
class stack {
  public:
	void push(const T& element);
	[[nodiscard]] std::optional<const T&> top() const;
	[[nodiscard]] bool empty() const;
	std::optional<T> pop();

  private:
	Container mData;
};

template <typename T, typename Container>
void stack<T, Container>::push(const T& element) {
	mData.push_back(element);
}

template <typename T, typename Container>
std::optional<const T&> stack<T, Container>::top() const {
	if (empty()) {
		return std::nullopt;
	}
	return mData.back();
}

template <typename T, typename Container>
bool stack<T, Container>::empty() const {
	return mData.empty();
}

template <typename T, typename Container>
std::optional<T> stack<T, Container>::pop() {
	T elem = mData.back();
	mData.pop_back();
	return elem;
}
