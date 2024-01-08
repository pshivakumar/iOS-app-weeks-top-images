//
//  ImageCell.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 8/1/24.
//

import SwiftUI
import URLImage

struct ImageCell: View {
    let result: ImageModel
    let isListMode: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if isListMode {
              // List Mode Layout
                listModeContent(result)
            } else {
                // Grid Mode Layout
                gridModeContent(result)
            }
        } //: VSTACK
        .padding(8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

@ViewBuilder
private func listModeContent(_ result: ImageModel) -> some View {
    HStack {
        if let url = result.images?.first?.link {
            URLImage(url) { image, _ in

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
            }
        }else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .foregroundColor(.gray)
        }
//        AsyncImage(url: result.images?.first?.link) { phase in
//            switch phase {
//            case .empty:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .cornerRadius(8)
//
//            case .success(let image):
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .cornerRadius(8)
//
//            case .failure:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .cornerRadius(8)
//                    .foregroundColor(.gray)
//            @unknown default:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .cornerRadius(8)
//                    .foregroundColor(.gray)
//            }
//        }
        VStack {
            Text(result.title)
                .font(.headline)
                .lineLimit(2)
                .padding(.top, 1)
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Text(formattedDate(result.datetime))
                .font(.caption)
                .padding(.bottom, 1)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                                
                if let images = result.images, images.count > 1 {
                    HStack {
                        
                        Image(systemName: "photo.circle.fill")
                            .padding(.bottom, 1)
                            .foregroundColor(.blue)
                        
                        Text("+\(images.count - 1)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.bottom, 1)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

    } //: HSTACK
}

@ViewBuilder
private func gridModeContent(_ result: ImageModel) -> some View {
    VStack {
        
        if let url = result.images?.first?.link {
            URLImage(url) { image, _ in

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .cornerRadius(8)
            }
        }else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(8)
                .foregroundColor(.gray)
        }
//        AsyncImage(url: result.images?.first?.link) { phase in
//            switch phase {
//            case .empty:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .cornerRadius(8)
//
//            case .success(let image):
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .cornerRadius(8)
//
//            case .failure:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .cornerRadius(8)
//                    .foregroundColor(.gray)
//            @unknown default:
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .cornerRadius(8)
//                    .foregroundColor(.gray)
//            }
//        }
        VStack {
            Text(result.title)
                .font(.subheadline)
                .lineLimit(3)
                .padding(.top, 2)

            HStack {
                Text(formattedDate(result.datetime))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let images = result.images, images.count > 1 {
                    HStack {
                        Image(systemName: "photo.circle.fill")
                            .padding(.bottom, 1)
                            .foregroundColor(.blue)
                        
                        Text("+\(images.count - 1)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.bottom, 1)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                }
            }
        } //: VSTACK
    } //: VSTACK
    .frame(height: 200)
}

private func formattedDate(_ timeInterval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeInterval)

    let formattedDateString = DateFormatter.localizedFormatter().string(from: date, format: "dd/MM/YY hh:mm a")

    return formattedDateString
}

struct ImageCell_Grid_Previews: PreviewProvider {
    // Preview for Grid mode with mock data
    static var previews: some View {
        let image1Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
        let image2Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
        let imageModel = ImageModel(id: "OV7T0Ws", title: "what are you doing up there?? cats are cats", datetime: 1704622864, images: [image1Detail, image2Detail])
        
        return ImageCell(result: imageModel, isListMode: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct ImageCell_List_Previews: PreviewProvider {
    // Preview for List mode with mock data
    static var previews: some View {
        let image1Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
        let image2Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
        let imageModel = ImageModel(id: "OV7T0Ws", title: "what are you doing up there?? cats are cats", datetime: 1704622864, images: [image1Detail, image2Detail])
        
        return ImageCell(result: imageModel, isListMode: true)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

