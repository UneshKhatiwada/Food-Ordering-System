from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Category, FoodItem

class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end_of_word = False

class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word):
        node = self.root
        for char in word.lower():  # case-insensitive
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_of_word = True

    def search_prefix(self, prefix):
        node = self.root
        for char in prefix.lower():
            if char not in node.children:
                return []
            node = node.children[char]
        return self._get_words_from_node(node, prefix.lower())

    def _get_words_from_node(self, node, prefix):
        words = []
        if node.is_end_of_word:
            words.append(prefix)
        for char, child_node in node.children.items():
            words.extend(self._get_words_from_node(child_node, prefix + char))
        return words

class FoodItemListView(ListView):
    model = FoodItem
    template_name = 'menu/item_list.html'
    context_object_name = 'food_items'
    paginate_by = 12

    def get_queryset(self):
        queryset = super().get_queryset().filter(is_available=True)
        search_query = self.request.GET.get('q')

        if search_query:
            # Build trie of available food item names
            trie = Trie()
            all_items = list(queryset)
            for item in all_items:
                trie.insert(item.name)

            # Get all names matching prefix
            matched_names = trie.search_prefix(search_query)

            # Filter queryset by matched names
            queryset = queryset.filter(name__in=matched_names)

        category_slug = self.request.GET.get('category')
        if category_slug:
            queryset = queryset.filter(category__slug=category_slug)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.all()
        return context
    
class FoodItemDetailView(DetailView):
    model = FoodItem
    template_name = 'menu/item_detail.html'
    context_object_name = 'food_item'
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['related_items'] = FoodItem.objects.filter(
            category=self.object.category,
            is_available=True
        ).exclude(id=self.object.id)[:4]
        return context

class CategoryListView(ListView):
    model = Category
    template_name = 'menu/category_list.html'
    context_object_name = 'categories'
