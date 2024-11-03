// comment-list.mock.ts
import { CommentListItem } from "types/interface";

const commentListMock: CommentListItem[] = [
    {
        nickname: "맛집탐방러",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.01",
        content: "이 메뉴 정말 맛있어 보여요! 추천 감사해요!"
    },
    {
        nickname: "영화광",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.02",
        content: "이 영화 정말 재미있었어요. 다음에 또 추천해 주세요!"
    },
    {
        nickname: "여행자",
        profileImage: null,  // 프로필 이미지가 없는 경우 기본 이미지를 사용하도록 설정
        writeDatetime: "2024.11.03",
        content: "다음 여행지로 강원도 추천합니다!"
    },
    {
        nickname: "책덕후",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.04",
        content: "이번 주말에는 책 한 권 추천해 주세요."
    },
    {
        nickname: "운동중독자",
        profileImage: null,
        writeDatetime: "2024.11.05",
        content: "요즘 운동 열심히 하고 있어요. 함께 운동해요!"
    },
    {
        nickname: "맛집탐험가",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.06",
        content: "이 음식 정말 맛있어 보입니다. 저도 한 번 먹어보고 싶네요."
    },
    {
        nickname: "여행러",
        profileImage: null,
        writeDatetime: "2024.11.07",
        content: "강릉 여행 정말 좋았어요. 강력 추천합니다!"
    },
    {
        nickname: "IT전문가",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.08",
        content: "이 기술 정말 유용하네요. 공유 감사합니다."
    },
    {
        nickname: "영화사랑",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        writeDatetime: "2024.11.09",
        content: "최신 영화 정말 재미있게 봤어요!"
    },
    {
        nickname: "운동마니아",
        profileImage: null,
        writeDatetime: "2024.11.10",
        content: "운동은 역시 헬스장이 최고입니다!"
    }
];

export default commentListMock;
