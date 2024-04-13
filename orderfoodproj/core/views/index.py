from django.shortcuts import render, redirect 
from django.core.paginator import Paginator

from core.models.dish import * 
from core.models.menu import * 


def index(request):
    query = request.GET.get('q')

    feature_list = Dish.objects.filter(featured=True)[:4] 
    categories = Menu.get_menu_by_quantity()
    
    if query:
        pass 
    else:
        dishes = Dish.objects.all().order_by('name')

    items_per_page = 10
    p = Paginator(dishes, items_per_page)
    page = request.GET.get('page')
    items = p.get_page(page)

    current = items.number 
    start = max(current - 2, 1)
    end = min(current + 2, items.paginator.num_pages)
    page_range = range(start, end)
    start_number = (current - 1) * items_per_page

    return render(request, 'core/index.html', {
        'feature_list': feature_list,
        'categories': categories,
        'items': items, 
        'start': start,
        'end': end,
        'page_range': page_range,
        'start_number': start_number
    }, status=200)
