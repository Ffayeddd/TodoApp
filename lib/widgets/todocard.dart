import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneornot;
  final Function myfunc;
  final int iii;
  final Function delete;

  const Todocard(
      {required this.vartitle,
      required this.doneornot,
      required this.myfunc,
      required this.iii, required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(iii);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(11),
          ),
          margin: const EdgeInsets.only(top: 33),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: doneornot ?  Colors.black : Colors.white,
                  fontSize: 22,
                  decoration: doneornot? TextDecoration.lineThrough : TextDecoration.none,

                ),
              ),
              Row(
                children: [
                  Icon(
                    doneornot ? Icons.check : Icons.close,
                    size: 27,
                    color: doneornot ? Colors.green : Colors.red,
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(iii);
                    },
                    icon: const Icon(Icons.delete),
                    iconSize: 27,
                    color:const Color.fromRGBO(255, 170, 88, 0.8),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
