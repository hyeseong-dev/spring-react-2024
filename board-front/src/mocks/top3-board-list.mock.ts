// latest-board-list.mock.ts
import { BoardListItem } from "types/interface";

const top3BoardListMock: BoardListItem[] = [
    {
        boardNumber: 1,
        title: "점심 메뉴 추천",
        content: "오늘 점심은 무엇을 먹을지 고민 중입니다. 추천 부탁드려요!",
        boardTitleImage: "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006",
        favoriteCount: 10,
        commentCount: 5,
        viewCount: 150,
        writeDatetime: "2024.11.01",
        writerNickname: "맛집탐방러",
        writerProfileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
    },
    {
        boardNumber: 2,
        title: "영화 추천 부탁드립니다",
        content: "주말에 볼만한 영화 추천해 주세요!",
        boardTitleImage: "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006",
        favoriteCount: 15,
        commentCount: 8,
        viewCount: 200,
        writeDatetime: "2024.11.02",
        writerNickname: "영화광",
        writerProfileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
    },
    {
        boardNumber: 3,
        title: "이 책 읽어보셨나요?",
        content: "최근에 나온 소설인데 궁금합니다. 리뷰 부탁드려요!",
        boardTitleImage: "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006",
        favoriteCount: 7,
        commentCount: 4,
        viewCount: 90,
        writeDatetime: "2024.11.03",
        writerNickname: "독서왕",
        writerProfileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
    }
];

export default top3BoardListMock;
