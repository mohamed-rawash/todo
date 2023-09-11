import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/colors.dart';

import '../../domain/entities/user_entities.dart';

class UserComponent extends StatelessWidget {
  final User user;
  const UserComponent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 8,
      shadowColor: AppColors.darkPurpleColor,
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Image.asset(
              "assets/images/avatar.jpg",
              fit: BoxFit.cover,
              width: 150,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 22,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.darkPurpleColor,
                                borderRadius:  BorderRadius.circular(16),
                              ),
                              child: const Icon(Icons.email, color: Colors.white, size: 24),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.darkPurpleColor,
                              borderRadius:  BorderRadius.circular(16),
                            ),
                            child: const Icon(Icons.web_outlined, color: Colors.white, size: 24),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
