// ignore_for_file: file_names

import 'package:news/constants.dart';
import 'package:news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = [];
  CategoryModel categoryModel;

  //1
  categoryModel = CategoryModel();
  categoryModel.categoryName = "All";
  categoryModel.imageAssetUrl = kAllImage;
  categoryModel.category = 'all';
  myCategories.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = kScienceImage;
  categoryModel.category = 'science';
  myCategories.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl = kTechnologyImage;
  categoryModel.category = 'technology';
  myCategories.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "India";
  categoryModel.imageAssetUrl = kIndiaImage;
  categoryModel.category = 'national';
  myCategories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Automobile";
  categoryModel.imageAssetUrl = kAutomobileImage;
  categoryModel.category = 'automobile';
  myCategories.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl = kEntertainmetImage;
  categoryModel.category = 'entertainment';
  myCategories.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = kSportsImage;
  categoryModel.category = 'sports';
  myCategories.add(categoryModel);

  //8
  categoryModel = CategoryModel();
  categoryModel.categoryName = "World";
  categoryModel.imageAssetUrl = kWorldImage;
  categoryModel.category = 'world';
  myCategories.add(categoryModel);

  //9
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl = kBusinessImage;
  categoryModel.category = 'business';
  myCategories.add(categoryModel);

  //10
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Politics";
  categoryModel.imageAssetUrl = kPoliticsImage;
  categoryModel.category = 'politics';
  myCategories.add(categoryModel);

  //11
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Startup";
  categoryModel.imageAssetUrl = kStartupImage;
  categoryModel.category = 'startup';
  myCategories.add(categoryModel);

  //12
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Something Different";
  categoryModel.imageAssetUrl = kDifferentImage;
  categoryModel.category = 'hatke';
  myCategories.add(categoryModel);

  //13
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Miscellaneous";
  categoryModel.imageAssetUrl = kMiscellaneousImage;
  categoryModel.category = 'miscellaneous';
  myCategories.add(categoryModel);

  return myCategories;
}
