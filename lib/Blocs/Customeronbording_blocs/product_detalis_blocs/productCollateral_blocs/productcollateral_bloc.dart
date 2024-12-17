import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/product_detalisApis/productcollateralApi/productcollateralApi.dart';

import '../../../../modeles/customeronboradingModel/product_detalisModels/productcollateral_Model/ProductcollateralModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'productcollateral_event.dart';
part 'productcollateral_state.dart';

class ProductcollateralBloc extends Bloc<ProductcollateralEvent, ProductcollateralState> {
  late ProductcollateralModel isproductcollateralModel;
  ProductcollateralApi productcollateralApi=ProductcollateralApi();
  ProductcollateralBloc() : super(ProductcollateralInitial()) {
    on<FetchProductcollateral>((event, emit) async{
      emit(ProductcollateralblocLoading());
      try{
        isproductcollateralModel=await productcollateralApi.postproductcollateraldata(event.userId, event.Customercode, event.ApplicationId, event.ProductName, event.BrandName, event.ModelName, event.ProductValue, event.ProductId, event.AddOnId, event.ctx);
        emit(ProductcollateralblocLoaded(productcollateralModel: isproductcollateralModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(ProductcollateralblocError(Errormessage: e.toString()));
      }

      // TODO: implement event handler
    });
  }
}
