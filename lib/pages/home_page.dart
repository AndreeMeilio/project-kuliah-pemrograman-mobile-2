
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_pertemuan_5_assignment/data/models/movies_model.dart';
import 'package:movies_app_pertemuan_5_assignment/data/repositories/movies_repository.dart';
import 'package:movies_app_pertemuan_5_assignment/pages/components/list_card_banner_component.dart';
import 'package:movies_app_pertemuan_5_assignment/pages/components/now_playing_card_banner_component.dart';
import 'package:movies_app_pertemuan_5_assignment/utils/colors_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const NowPlayingSection(),
              const TrendingSection(),
              const PopulerSection(),
              const TopRatedSection(),
              const SizedBox(height: 24.0,)
            ],
          ),
        )
      )
    );
  }
}

class NowPlayingSection extends StatefulWidget {
  const NowPlayingSection({super.key});

  @override
  State<NowPlayingSection> createState() => _NowPlayingSectionState();
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.55,
      decoration: BoxDecoration(
        color: ColorUtil.background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Center(child: Text("Now Playing", style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),),
          ),
          Expanded(
            child: FutureBuilder<List<MoviesModel>>(
              future: MoviesRepository().getAllDataNowPlaying(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  );
                } else if (snapshot.connectionState == ConnectionState.done){
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 1,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        
                      },

                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index, pageIndex) {
                      return NowPlayingCardBannerComponent(
                        data: snapshot.data?[index],
                        key: ValueKey("nowPlaying$index"),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Terjadi kesalahan saat mencoba mendapatkan data Now Playing", style: TextStyle(color: Colors.red, fontSize: 16.0),),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class TrendingSection extends StatefulWidget {
  const TrendingSection({super.key});

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.275,
      decoration: BoxDecoration(
        color: ColorUtil.background
      ),
      child: FutureBuilder<List<MoviesModel?>>(
        future: MoviesRepository().getAllDataTrending(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            return ListCardBannerComponent(
              titleSection: "Trending",
              data: snapshot.data ?? [],
            );
          } else {
            return Center(
              child: Text("Terjadi kesalahan saat mencoba mendapatkan data Trending", style: TextStyle(color: Colors.red, fontSize: 16.0),),
            );
          }
        },
      )
    );
  }
}

class PopulerSection extends StatefulWidget {
  const PopulerSection({super.key});

  @override
  State<PopulerSection> createState() => _PopulerSectionState();
}

class _PopulerSectionState extends State<PopulerSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.275,
      decoration: BoxDecoration(
        color: ColorUtil.background
      ),
      child: FutureBuilder<List<MoviesModel?>>(
        future: MoviesRepository().getAllDataPopuler(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            return ListCardBannerComponent(
              titleSection: "Populer",
              data: snapshot.data ?? [],
            );
          } else {
            return Center(
              child: Text("Terjadi kesalahan saat mencoba mendapatkan data Populer", style: TextStyle(color: Colors.red, fontSize: 16.0),),
            );
          }
        },
      )
    );
  }
}

class TopRatedSection extends StatefulWidget {
  const TopRatedSection({super.key});

  @override
  State<TopRatedSection> createState() => _TopRatedSectionState();
}

class _TopRatedSectionState extends State<TopRatedSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.275,
      decoration: BoxDecoration(
        color: ColorUtil.background
      ),
      child: FutureBuilder<List<MoviesModel?>>(
        future: MoviesRepository().getAllDataTopRated(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            return ListCardBannerComponent(
              titleSection: "Top Rated",
              data: snapshot.data ?? [],
            );
          } else {
            return Center(
              child: Text("Terjadi kesalahan saat mencoba mendapatkan data Top Rated", style: TextStyle(color: Colors.red, fontSize: 16.0),),
            );
          }
        },
      )
    );
  }
}