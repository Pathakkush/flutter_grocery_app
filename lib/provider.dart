import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/product_filter.dart';

import '../models/pagination.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModeL) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
        paginationModeL.page, paginationModeL.pageSize);
  },
);

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, productFilterModel) {
    final apiRespository = ref.watch(apiService);
    return apiRespository.getProducts(productFilterModel);
  },
);
