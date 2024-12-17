import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/product_detalisApis/productdetalisApi/ProductdetalisApi.dart';

import '../../../../modeles/customeronboradingModel/product_detalisModels/productdetalisModel/ProductdetalisModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'productdetalis_event.dart';
part 'productdetalis_state.dart';

class ProductdetalisBloc extends Bloc<ProductdetalisEvent, ProductdetalisState> {
  late ProductdetalisModel isproductdetalisModel;
  ProductdetalisApi productdetalisApi=ProductdetalisApi();
  ProductdetalisBloc() : super(ProductdetalisInitial()) {
    on<FetchProductdetalis>((event, emit) async{
      emit(ProductdetalisblocLoading());
      try{
        isproductdetalisModel=await productdetalisApi.postproductdetalisdata(event.userId,event.ctx);
        emit(ProductdetalisblocLoaded(productdetalisModel: isproductdetalisModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        print(e.toString());
        emit(ProductdetalisblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
