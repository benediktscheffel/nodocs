import 'package:nodocs/features/scan/model/collection_dropdown_model.dart';

abstract class CollectionDropdownService {
  CollectionDropdownModel getCollectionDropdown();
  CollectionDropdownModel openCollection(final String path);
  CollectionDropdownModel closeCollection(final String path);
}