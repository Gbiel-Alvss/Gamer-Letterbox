import 'package:flutter/material.dart';

class ReviewCardLarge extends StatelessWidget {

  final String username;

  final String review;

  final String date;

  const ReviewCardLarge({

    super.key,

    required this.username,

    required this.review,

    required this.date,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 18,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: const Color(0xFF0D1320),

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: Colors.white10,
        ),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              const CircleAvatar(

                backgroundColor:
                    Color(0xFF39FF14),

                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(

                      username,

                      style:
                          const TextStyle(

                        color: Colors.white,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(

                      children: List.generate(

                        5,

                        (index) =>
                            const Icon(

                          Icons.star,

                          color:
                              Color(0xFF39FF14),

                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Text(

                date,

                style: TextStyle(

                  color: Colors.white
                      .withOpacity(0.5),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(

            review,

            style: TextStyle(

              color:
                  Colors.white.withOpacity(
                0.82,
              ),

              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          Row(

            children: [

              Icon(
                Icons.thumb_up_alt_outlined,
                color:
                    Colors.white.withOpacity(
                  0.6,
                ),
                size: 18,
              ),

              const SizedBox(width: 6),

              Text(

                '1.2k',

                style: TextStyle(

                  color: Colors.white
                      .withOpacity(0.6),
                ),
              ),

              const SizedBox(width: 20),

              Icon(
                Icons.mode_comment_outlined,
                color:
                    Colors.white.withOpacity(
                  0.6,
                ),
                size: 18,
              ),

              const SizedBox(width: 6),

              Text(

                '42',

                style: TextStyle(

                  color: Colors.white
                      .withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}