class CollectionNode {

  const CollectionNode({
    required this.path,
    required this.children,
    required this.displayName});
  final String path;
  final String displayName;

  final List<CollectionNode> children;
  
  add(final CollectionNode node) {
    children.add(node);
  }

}