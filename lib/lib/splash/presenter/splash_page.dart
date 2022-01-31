import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_awesome/lib/splash/cubit/splash_cubit.dart';
import 'package:local_notification_awesome/lib/splash/cubit/splash_state.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => Modular.get<SplashCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            context.read<SplashCubit>().getConfigurations();
            if (state is LoadingState) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset(
                      "images/logo_kami.png", width: 210, height: 210,),
                  )
              );
            } else if (state is SuccessState) {
              Modular.to.pushReplacementNamed(
              Modular.initialRoute + "home", forRoot: true);
            }
            return Container();
          },
        ),
      ),
    );
  }
}