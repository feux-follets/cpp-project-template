import fmt;

template <typename T>
T max(T a, T b) {
	static_assert(sizeof(T) > 10, "T too small");
	return b < a ? a : b;
}

int main() {
	max(1, 2);
}
