//= require jquery
//= require underscore
//= require backbone

var CartItemModel = Backbone.Model.extend({
  initialize: function(){
    console.log('cart item model initialized');
  }
});
var CartItemsCollection = Backbone.Collection.extend({
  initialize: function(){
    console.log('cart items collection initialized');
  }
});
var CartModel = Backbone.Model.extend({
  initialize: function(model){
    console.log('cart model initialized');
    this.items = new CartItemsCollection(model.items);
  }
});
var MiniCartView = Backbone.View.extend({
  el:'#mini-cart',
  template: "<li>Item</li>",
  initialize: function(){
    console.log('mini cart view initialize');
    this.render();
  },
  events: {
    'click #mini-cart-show-detail': "showDetail"
  },
  render: function(){
    console.log('mini cart view render');
    console.log('cart:', this.model.get('created') , 'cart items:', this.model.get('items'));
    this.$el.find('#mini-cart-wrap').html();
  },
  showDetail: function(){
    console.log('show mini cart detail');
  }
});