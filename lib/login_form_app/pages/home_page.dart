import 'package:fl_bloc/login_form_app/bloc/auth_bloc.dart';
import 'package:fl_bloc/login_form_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('User'),
            IconButton(
              onPressed: () {
                authBloc.add(SignoutRequest());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Signout completed'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Text(state.userMail!);
          } else if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
