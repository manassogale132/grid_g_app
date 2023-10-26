import 'package:flutter/material.dart';

class CustomInfoBottomSheetWidget extends StatelessWidget {
  const CustomInfoBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 40,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'App Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '⩩ Custom Grid Generator',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'By - Manas Sogale (Software Engineer)',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Mobile application developer with over 2.5+ years of front-end experience at MantraLabs and passion for responsive mobile application designs. Passionate about hybrid mobile development with modern UI design frameworks(Flutter, React). 📱',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'App Features -',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '〄  Can create custom grid-list with 2 custom parameters.\n〄  Can reset last generated grid.\n〄  Has search functionality only when grid is active or visible.\n〄  Has custom dialog view with textfield validations.\n〄  Has custom App info bottom-sheet UI.\n〄  Has native animated splash screen.\n〄  Has custom confetti animation.\n〄  Custom App-icon.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 45,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 35,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
